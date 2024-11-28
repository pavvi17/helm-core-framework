{{/*
Expand the name of the chart.
*/}}
{{- define "base-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "otelCollectorName" -}}
{{ .Values.environment.service_name }}-otel-collector
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "base-helm.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "base-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "base-helm.labels" -}}
helm.sh/chart: {{ include "base-helm.chart" . }}
{{ include "base-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "base-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "base-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "base-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "base-helm.fullname" .) .Values.environment.service_name }}
{{- else }}
{{- default "default" .Values.environment.service_name }}
{{- end }}
{{- end }}

{{/*
Create the hook name of the service account to use
*/}}
{{- define "hookServiceAccountName" }}
{{- .Values.environment.service_name }}-hook
{{- end }}


{{/*
Create the name of the chartName of main app to use
*/}}
{{- define "main-helm.chartName" -}}
{{- .Values.environment.service_name }}
{{- end }}

{{/*
Create the name of the secretStoreName for app
*/}}
{{- define "secretStoreName" -}}
{{- .Values.environment.service_name }}-secrets-store
{{- end -}}
