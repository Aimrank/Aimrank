{{- define "aimrank-cluster.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-cluster.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-cluster.migrator" -}}
{{- $name := include "aimrank-cluster.fullname" . }}
{{- printf "%s-%s-%d" $name "migrator" .Release.Revision | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-cluster.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aimrank-cluster.name" . }}
app.kubernetes.io/instance: {{ include "aimrank-cluster.fullname" . }}
{{- end }}

{{- define "aimrank-cluster.postgres" -}}
{{- printf "%s-%s" .Release.Name "postgres" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-cluster.rabbitmq" -}}
{{- printf "%s-%s" .Release.Name "rabbitmq" | trunc 63 | trimSuffix "-" }}
{{- end }}
