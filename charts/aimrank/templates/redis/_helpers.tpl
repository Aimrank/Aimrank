{{- define "aimrank.redis" -}}
{{ printf "%s-%s" .Release.Name "redis" }}
{{- end }}

{{- define "aimrank.redis.labels" -}}
app: {{ include "aimrank.redis" . }}-cache
{{- end }}
