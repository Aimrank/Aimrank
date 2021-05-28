{{- define "aimrank.mailhog" -}}
{{ printf "%s-%s" .Release.Name "mailhog" }}
{{- end }}

{{- define "aimrank.mailhog.labels" -}}
app: {{ include "aimrank.mailhog" . }}
{{- end }}
