{{- define "aimrank.postgres" -}}
{{ printf "%s-%s" .Release.Name "postgres" }}
{{- end }}

{{- define "aimrank.postgres.labels" -}}
app: {{ include "aimrank.postgres" . }}-db
{{- end }}
