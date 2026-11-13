# STRATUM API + console (slim, non-root). Build: docker build -t stratum .   Run: docker run -p 127.0.0.1:8000:8000 stratum
FROM python:3.15-slim@sha256:65a65fc7b30b06cb6df4930fd4650697cb23f4c2698ab81fc87e4b031bc36928 AS base
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY pyproject.toml README.md ./
COPY stratum ./stratum
RUN pip install --no-cache-dir ".[api]" \
 && useradd --uid 10001 --no-create-home stratum
USER 10001
LABEL org.opencontainers.image.source="https://github.com/rakshit-737/stratum-cloud-security" \
      org.opencontainers.image.description="STRATUM open mini-CNAPP API and console" \
      org.opencontainers.image.licenses="MIT"
EXPOSE 8000
# STRATUM_SOURCE=synthetic | real (mount the corpus at /data) | live (packaged CI replay) | /path/to/dataset.json
ENV STRATUM_SOURCE=synthetic STRATUM_DATA=/data
CMD ["uvicorn", "stratum.api:app", "--host", "0.0.0.0", "--port", "8000"]
