# Advanced configuration

## Trace exporters

| Environment variable              | Default value                    | Support     | Description                                                                                                                              |
| --------------------------------- | -------                          | ----------- | ---                                                                                                                                      |
| `OTEL_TRACES_EXPORTER`            | `otlp`                           | Stable      | Select the traces exporter to use. We recommend using the OTLP exporter (`otlp`).
| `OTEL_EXPORTER_OTLP_ENDPOINT`     | `http://localhost:4318`          | Stable      | The OTLP endpoint to connect to.

The Splunk Distribution of OpenTelemetry Ruby uses the OTLP traces exporter as
the default setting. For debugging purposes, use the `console` exporter, which writes
spans directly to the console.

An example of setting an alternate trace exporter:

```
export OTEL_TRACES_EXPORTER=console
```

## Exporting directly to Splunk Observability Cloud

To export traces directly to Splunk Observability Cloud, bypassing the Collector,
set the `SPLUNK_ACCESS_TOKEN` and `SPLUNK_REALM` environment variables.

| Environment variable                  | Config Option | Default value | Support     | Description                                                                                                                                          |
| -------------------------------------- | ------------ | ------------  | ----------- | ---                                                                                                                                                  |
| `SPLUNK_ACCESS_TOKEN`                  | | unset         | Stable      | Splunk authentication token that lets exporters send data directly to Splunk Observability Cloud. Unset by default. Not required unless you need to send data to the Observability Cloud ingest endpoint. See [Create and manage authentication tokens using Splunk Observability Cloud](https://docs.splunk.com/Observability/admin/authentication-tokens/tokens.html#admin-tokens).                               |
| `SPLUNK_REALM`                         | | `us0`           | Stable      | The name of your organization’s realm, for example, us0. When you set the realm, traces are sent directly to the ingest endpoint of Splunk Observability Cloud, bypassing the Splunk OpenTelemetry Collector. |
| `SPLUNK_TRACE_RESPONSE_HEADER_ENABLED` | `trace_response_header_enabled` | `True` | Experimental | Enables adding server trace information to HTTP response headers in Rack middleware. |

## Propagators configuration

| Environment variable   | Config Option | Default value          | Support | Description                                          |
| ---------------------- | ------------- | ---------------------- | ------- | ---------------------------------------------------- |
| `OTEL_PROPAGATORS`     |               | `tracecontext,baggage` | Stable  | Comma-separated list of propagator names to be used.                 |

To keep backward compatibility with manual instrumentation for the SignalFx Ruby Tracing library, set the trace propagator to B3:

```
export OTEL_PROPAGATORS=b3multi
```

## Trace configuration

| Environment variable      | Config Option         | Default value             | Notes                                                                                                                                                                                                         |
| ------------------------- | --------------------- | ------------------------- | ----------------------------------------------------------------------                                                                                                                                        |
| `OTEL_SERVICE_NAME`                 | `service_name`          | `unnamed-ruby-service`  | The service name of this Ruby application. |
| `OTEL_RESOURCE_ATTRIBUTES`          |                       | unset                     | Comma-separated list of resource attributes added to every reported span. <details><summary>Example</summary>`service.name=my-ruby-service,service.version=3.1,deployment.environment=production`</details> |
| `OTEL_SPAN_ATTRIBUTE_COUNT_LIMIT`   |                       | `""` (unlimited)          | Maximum number of attributes per span.  |
| `OTEL_EVENT_ATTRIBUTE_COUNT_LIMIT`  |                       | `""` (unlimited)          | Maximum number of attributes per event.  |
| `OTEL_LINK_ATTRIBUTE_COUNT_LIMIT`   |                       | `""` (unlimited)          | Maximum number of attributes per link.  |
| `OTEL_SPAN_EVENT_COUNT_LIMIT`       |                       | `""` (unlimited)          | Maximum number of events per span. |
| `OTEL_SPAN_LINK_COUNT_LIMIT`        |                       | `1000`                    | Maximum number of links per span. |
| `OTEL_ATTRIBUTE_VALUE_LENGTH_LIMIT` |                       | `12000`                   | Maximum length of strings for span attribute values. Values larger than the limit are truncated. |
