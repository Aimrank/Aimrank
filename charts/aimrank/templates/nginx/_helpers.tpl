{{- define "aimrank.nginx" -}}
{{ printf "%s-%s" .Release.Name "nginx" }}
{{- end }}

{{- define "aimrank.nginx.labels" -}}
app: {{ include "aimrank.nginx" . }}
{{- end }}
