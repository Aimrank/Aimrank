# Aimrank

Container project for all other services

| Service | Build status |
| :------ | :---------- |
| [Aimrank.Web](https://github.com/Aimrank/Aimrank.Web) | ![Docker build status](https://github.com/Aimrank/Aimrank.Web/workflows/Master%20build/badge.svg) |
| [Aimrank.Agones](https://github.com/Aimrank/Aimrank.Agones) | ![Docker build status](https://github.com/Aimrank/Aimrank.Agones/workflows/Master%20build/badge.svg) |
| [Aimrank.Agones.Cluster](https://github.com/Aimrank/Aimrank.Agones) | ![Docker build status](https://github.com/Aimrank/Aimrank.Agones.Cluster/workflows/Master%20build/badge.svg) |

## About

Aimrank is a website that let's you play competitive CS:GO matches on aim maps.
You pick maps that you want to play and based on match configuration you can play 1 vs 1 or 2 vs 2.
All statistics from games are tracked and after each match players rating is adjusted.
Aimrank automatically pairs you with other players with similar rating, configures and starts CS:GO server.
Then players are given server ip address and can connect from the in-game console.

## Clone all repositories

Clone this repository first. Then go to root project directory and execute following command:

```bash
./scripts/git-clone-all.sh
```

This will loop through all other repositories and clone them in current directory.

## Kubernetes and Helm

The project can be started on kubernetes cluster with version 1.18+.
Because this project uses Agones to run game servers - Agones must be installed
on your cluster. When you already have Agones working you can deploy aimrank using helm:

```bash
helm install aimrank-release ./charts/aimrank 
```

Check out `values.yaml` files and overwrite values that you want to change.

When all pods are up and running you must add some Steam server tokens to database.
Without them CS:GO servers will fail to start. You need to have as many steam tokens
in database as CS:GO servers you want to run. You can add steam tokens in few ways:

1. Add them directly to database:
    - Exec into running postgres pod and add steam tokens to table `cluster.steam_tokens (token)` in `aimrank_cluster` database.
    - Forward port `kubectl port-forward <postgres_pod_name> 5432:5432` and add tokens with some database client.
2. Register new user, set his role to 'Admin' and add tokens from admin panel
    - Register new user
    - Use any method from point 1 to update database with name `aimrank`. Add row to `users.users_roles` with registered user Id and role 'Admin'
    - Log out and log in again.
    - Go to admin panel using navigation in header.
    - Go to steam tokens section and add steam tokens.

Now when steam tokens are in place you can start CS:GO servers. To do it you just need to scale
CS:GO servers fleet up (by default replicas are set to 0 so that CS:GO servers don't start directly after deployment).

```bash
# Find fleet name
kubectl get fleet

# Scale fleet up
kubectl scale fleet <fleet_name> --replicas=<number_of_replicas>
```

## Microk8s

This project is configured to run on microk8s single node cluster for local development purposes.
To start project on using microk8s first you need to label your microk8s node with `storage=enabled`.
After that go to project root directory and run:

```bash
# Build all projects images with 'local' tag and push them to microk8s images registry 'localhost:32000'
./scripts/microk8s-build.sh
# Install chart on microk8s
./scripts/microk8s-start.sh
```

To visit web application in your browser you need forward nginx https port from nginx pod:

```bash
microk8s kubectl get pods
microk8s kubectl port-forward <name_of_nginx_pod> 8080:443
```

Then visit `https://localhost:8080` in your browser. Keep in mind that links in emails
(for example confirm email address) might not contain correct port.