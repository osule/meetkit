{{/*
Expand the name of the chart.
*/}}
{{- define "meetkit.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "meetkit.fullname" -}}
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
{{- define "meetkit.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "meetkit.labels" -}}
helm.sh/chart: {{ include "meetkit.chart" . }}
{{ include "meetkit.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "meetkit.selectorLabels" -}}
app.kubernetes.io/name: {{ include "meetkit.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Validate required values
*/}}
{{- define "meetkit.validateValues" -}}
{{- if not .Values.domain }}
{{- fail "domain is required. Please set .Values.domain" }}
{{- end }}
{{- if not .Values.jvb.advertiseIps }}
{{- fail "jvb.advertiseIps is required. Please set .Values.jvb.advertiseIps" }}
{{- end }}
{{- if not .Values.credentials.secretName }}
{{- fail "credentials.secretName is required. Please set .Values.credentials.secretName" }}
{{- end }}
{{- if eq .Values.auth.type "jwt" }}
{{- if not .Values.auth.jwt.secretName }}
{{- fail "auth.jwt.secretName is required when auth.type is jwt" }}
{{- end }}
{{- end }}
{{- end }}
