{{/* 
  Generate full name for resources, e.g. "quote-app-backend"
*/}}
{{- define "quote-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/* Short chart/app name */}}
{{- define "quote-app.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{/* Chart label (normalize '+' which is illegal in labels) */}}
{{- define "quote-app.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/* Standard labels for ALL resources */}}
{{- define "quote-app.labels" -}}
helm.sh/chart: {{ include "quote-app.chart" . }}
app.kubernetes.io/name: {{ include "quote-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* 
  Selector labels used by Deployments/Services to match Pods.
  Keep this minimal and STABLE over time.
*/}}
{{- define "quote-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "quote-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* Optional: service account name helper (use if/when needed) */}}
{{- define "quote-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (printf "%s-sa" (include "quote-app.fullname" .)) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
