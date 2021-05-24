{{- define "aimrank-agones-cluster.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-agones-cluster.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-agones-cluster.migrator" -}}
{{- $name := include "aimrank-agones-cluster.fullname" . }}
{{- printf "%s-%s-%d" $name "migrator" .Release.Revision | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-agones-cluster.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aimrank-agones-cluster.name" . }}
app.kubernetes.io/instance: {{ include "aimrank-agones-cluster.fullname" . }}
{{- end }}

{{- define "aimrank-agones-cluster.postgres" -}}
{{- printf "%s-%s" .Release.Name "postgres" | trunc 63 | trimSuffix "-" }}
{{- end }}
