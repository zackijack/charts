{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the app.
*/}}
{{- define "server.name" -}}
{{- $name := default "server" .Values.server.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the name of the worker.
*/}}
{{- define "worker.name" -}}
{{- $name := default "worker" .Values.worker.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand the name of the debugger.
*/}}
{{- define "debugger.name" -}}
{{- $name := default "debugger" .Values.debugger.nameOverride -}}
{{- $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "meta.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "app.labels" -}}
name: {{ .Release.Name }}
env: {{ .Values.meta.env }}
version: {{ .Values.meta.version }}
maintainer: {{ .Values.meta.maintainer }}
managed-by: {{ .Release.Service }}
helm-chart: {{ include "meta.chart" . }}
{{- end -}}
