from fastapi import FastAPI
import redis

app = FastAPI()

r = redis.Redis(host="redis", port=6379)


@app.get("/")
async def root():
    print("hallpo")

    print("hallpo")

    return {"message": "Hello Worldddd"}


@app.get("/hits")
async def read_root():
    r.incr("hits")
    return {"number of hits": r.get("hits")}

