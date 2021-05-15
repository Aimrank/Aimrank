{{- define "aimrank-pod.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-pod.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-pod.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aimrank-pod.name" . }}
app.kubernetes.io/instance: {{ include "aimrank-pod.fullname" . }}
{{- end }}

{{- define "aimrank-pod.rabbitmq" -}}
{{- printf "%s-%s" .Release.Name "rabbitmq" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aimrank-pod.cluster" -}}
{{- printf "%s-%s" .Release.Name "aimrank-cluster" | trunc 63 | trimSuffix "-" }}
{{- end }}
