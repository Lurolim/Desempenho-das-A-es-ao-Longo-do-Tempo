setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Instalar e carregar o pacote readxl
library(tidyverse)
library(readxl)


dirty_base = read_xlsx(path = "Desempenho das Ações ao Longo do Tempo.xlsx", na = "-")

clean_base = pivot_longer(data = dirty_base, 
                          cols = c("ABEV3", "BBAS3", "BBDC4", "ITUB4", 
                                   "JBSS3", "KLBN3", "PETR4", "SANB3", "VALE3", "WEGE3"), 
                          names_to = "ticker", 
                          values_to = "preco") |>
  
  mutate(Data = ymd(Data), preco = as.numeric(preco)) |>
  filter(!is.na(preco)) |>
  arrange(ticker, Data) |>
  group_by(ticker) |>
  mutate(r_diario = (preco - lag(preco)) / lag(preco))|>
  ungroup()

clean_base = clean_base |>
  group_by(ticker) |>
  mutate(valor_investido = 100 * cumprod(1 + if_else(is.na(r_diario), 0 , r_diario)))|>
  ungroup()

ggplot(clean_base, aes(x = Data, y = valor_investido, color = ticker)) +
  geom_line() +
  labs(title = "Desempenho das Ações ao Longo do Tempo",
       x = "Data",
       y = "Valor do Investimento (R$)") +
  theme_light() +
  annotate("rect", xmin = as.Date("2020-03-01"), xmax = as.Date("2021-02-28"), ymin = -Inf, ymax = Inf, 
           fill = "grey", alpha = 0.4) +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year")

str(clean_base)