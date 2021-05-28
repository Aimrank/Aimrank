{{- define "aimrank-agones.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-agones.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-agones.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aimrank-agones.name" . }}
app.kubernetes.io/instance: {{ include "aimrank-agones.fullname" . }}
{{- end }}

{{- define "aimrank-agones.rabbitmq" -}}
{{- printf "%s-%s" .Release.Name "rabbitmq" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-agones.cluster" -}}
{{- printf "%s-%s" .Release.Name "aimrank-agones-cluster" | trunc 63 | trimSuffix "-" }}
{{- end }}