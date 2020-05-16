import { Application } from "https://deno.land/x/oak/mod.ts";

const app = new Application();

app.use((ctx) => {
  ctx.response.body = "Hello world! from oak";
});

console.log("http://localhost:8000/");

await app.listen("127.0.0.1:8000");
