FROM bitwalker/alpine-elixir-phoenix:1.12.3

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix deps.get

COPY . .
RUN mix deps.compile


COPY assets/package.json assets/package-lock.json ./assets/
RUN npm install --prefix ./assets


CMD ["mix", "phx.server"]
