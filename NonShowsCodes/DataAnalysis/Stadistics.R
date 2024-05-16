## Limpieza del ambiente
rm(list=ls())

## Carga de librerias
library(readxl)
library(dplyr)
library(ggplot2)
library(tidyr)
library(gtsummary)
library(labelled)
library(dplyr)
library(Hmisc)

## Carga de datos
data <- readxl::read_xlsx("data/df.xlsx")

## Resumen de los datos 
summary(data)
names(data)
str(data)

## Renombrar columnas en formato unificado
data <- data %>%
  rename_with(~tolower(gsub(" ", "_", .)) %>%
                gsub("\\.", "", .) %>%
                gsub("-", "", .), .cols = everything())


# Asignando etiquetas y convirtiendo las variables categóricas en factores con sus niveles y etiquetas correspondientes
data <- data %>%
  mutate(
    tipo_de_cita = factor(tipo_de_cita,
                          levels = c(0, 1),
                          labels = c("Absences", "Attendances")),
    sexo = factor(sexo,
                  levels = c(0, 1),
                  labels = c("Female", "Male")),
    día_cita = factor(día_cita,
                      levels = c(0, 1, 2, 3, 4, 5, 6),
                      labels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")),
    mes_cita = factor(mes_cita,
                      levels = 1:12,
                      labels = c("January", "February", "March", "April", "May", "June",
                                 "July", "August", "September", "October", "November", "December")),
    hora = factor(hora,
                  levels = c(6, 8, 10, 12, 14, 16),
                  labels = c("6:00 to 8:00", "8:00 to 10:00", "10:00 to 12:00", 
                             "12:00 to 14:00", "14:00 to 16:00", "16:00 to 18:00")),
  )

# Asignando etiquetas a cada variable con Hmisc::label()
data <- within(data, {
  label(tipo_de_cita) <- "Type of appointment"
  label(edad) <- "Age"
  label(sexo) <- "Sex"
  label(aseguradora_tipo) <- "Type of insurance coverage"
  label(numero_dx) <- "Number of diagnoses"
  label(hosp_reciente) <- "Number of recent hospitalization"
  label(numero_de_mx) <- "Number of medications"
  label(hora) <- "Hour of appointment"
  label(día_cita) <- "Day of the appointment"
  label(mes_cita) <- "Month of the appointment"
  label(intervalo_creación__asignación) <- "Interval creation to assignment"
  label(asistencias_previas) <- "Number of previous attendances"
  label(inasistencias_previas) <- "Number of previous absences"
})


table(data$hosp_reciente)



## Resumen de los datos
names(data)
str(data)


# Crear la Tabla 1
table1 <- data %>%
  tbl_summary(
    by = tipo_de_cita,
    # Establecer todas las variables como continuas
    type = list(
      edad ~ "continuous2",
      numero_dx ~ "continuous2",
      hosp_reciente ~ "continuous2",
      numero_de_mx ~ "continuous2",
      intervalo_creación__asignación ~ "continuous2",
      asistencias_previas ~ "continuous2",
      inasistencias_previas ~ "continuous2"
    ),
    # Definir las estadísticas para las variables continuas
    statistic = list(
      all_continuous() ~ c("{mean} ({sd})", "{median} ({p25}, {p75})"),
      # Aquí se asume que las demás variables no listadas son categóricas
      all_categorical() ~ "{n} ({p}%)"
    ),
    digits = everything() ~ 2
  ) %>%
  add_p() %>%
  add_overall() %>%
  add_q()

# Ver la Tabla 1
table1


