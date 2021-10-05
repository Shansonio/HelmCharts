{{- define "rand" -}}
{{- toJson .Values | sha256sum -}}
{{- end -}}