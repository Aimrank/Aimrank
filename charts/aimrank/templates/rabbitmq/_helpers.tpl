{{- define "aimrank.rabbitmq" -}}
{{ printf "%s-%s" .Release.Name "rabbitmq" }}
{{- end }}

{{- define "aimrank.rabbitmq.labels" -}}
app: {{ include "aimrank.rabbitmq" . }}-bus
{{- end }}

{{- define "aimrank.rabbitmq.headless" -}}
{{ printf "%s-%s" (include "aimrank.rabbitmq" .) "headless" }}
{{- end }}