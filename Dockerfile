FROM python:3.10-slim
WORKDIR /code
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY ./src ./src
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]