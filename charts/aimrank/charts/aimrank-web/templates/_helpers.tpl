{{- define "aimrank-web.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-web.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-web.migrator" -}}
{{- $name := include "aimrank-web.fullname" . }}
{{- printf "%s-%s-%d" $name "migrator" .Release.Revision | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aimrank-web.name" . }}
app.kubernetes.io/instance: {{ include "aimrank-web.fullname" . }}
{{- end }}

{{- define "aimrank-web.postgres" -}}
{{- printf "%s-%s" .Release.Name "postgres" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-web.rabbitmq" -}}
{{- printf "%s-%s" .Release.Name "rabbitmq" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-web.redis" -}}
{{- printf "%s-%s" .Release.Name "redis" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-web.cluster" -}}
{{- printf "%s-%s" .Release.Name "aimrank-agones-cluster" | trunc 63 | trimSuffix "-" }}
{{- end }}
