# Aimrank

Container project for all other services

| Service | Build status |
| :------ | :---------- |
| [Aimrank.Pod](https://github.com/Aimrank/Aimrank.Pod) | ![Docker build status](https://github.com/Aimrank/Aimrank.Pod/workflows/Build/badge.svg) |
| [Aimrank.Web](https://github.com/Aimrank/Aimrank.Web) | ![Docker build status](https://github.com/Aimrank/Aimrank.Web/workflows/Build/badge.svg) |
| [Aimrank.Cluster](https://github.com/Aimrank/Aimrank.Cluster) | ![Docker build status](https://github.com/Aimrank/Aimrank.Cluster/workflows/Build/badge.svg) |

## About

Aimrank is a website that let's you play competitive CS:GO matches on aim maps. You pick maps that you want to play and based on match configuration you can play 1 vs 1 or 2 vs 2. All statistics from games are tracked and after each match players rating is adjusted. Aimrank automatically pairs you with other players with similar rating, configures and starts CS:GO server. Then players are given server ip address and can connect from the in-game console.

## Development

Clone this repository first. Then go to root project directory and execute following command:

```bash
./scripts/git-clone-all.sh
```

This will loop through all other repositories and clone them in current directory.
