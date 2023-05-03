{{/* Common labels shared across objects */}}
{{- define "common.helpers.labels" -}}
helm.sh/chart: {{ include "common.helpers.names.chart" . }}
{{ include "common.helpers.labels.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
  {{- with .Values.labels }}
    {{- range $k, $v := . }}
      {{- $name := $k }}
      {{- $value := tpl $v $ }}
{{ $name }}: {{ quote $value }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/* Selector labels shared across objects */}}
{{- define "common.helpers.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.helpers.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
release: {{ .Release.Name }}
{{- end -}}
