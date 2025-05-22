library(targets)

list(
  tar_target(
    pokemon_csv,
    "https://gist.githubusercontent.com/simsketch/1a029a8d7fca1e4c142cbfd043a68f19/raw/bd584ee6c307cc9fab5ba38916e98a85de9c2ba7/pokemon.csv",
    format = "url"
  ),
  tar_target(
    df_raw,
    data.table::fread(pokemon_csv, nrows = 310)
  ),
  tar_target(
    body_lm,
    df_raw[, list(NAME, HEIGHT, WEIGHT)] |>
      janitor::clean_names() |>
      lm(height ~ weight, data = _) |>
      broom::tidy()
  )
)

# targets::tar_make()
