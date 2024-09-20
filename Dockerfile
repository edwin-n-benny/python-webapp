FROM python:3.10-slim AS builder

WORKDIR /app

COPY requirements.txt /app

RUN pip install --user -r requirements.txt

COPY . /app

FROM python:3.10-slim 

WORKDIR /app

COPY --from=builder /app /app 
COPY --from=builder /root/.local /root/.local

ENV PATH="/root/.local:$PATH"

EXPOSE 5000

CMD ["python", "app.py"]

