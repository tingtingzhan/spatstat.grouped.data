

#' @title Ki67 Data
#' 
#' @description 
#' Ki67 cell data containing 622 patients.
#' 
#' @format
#' \describe{
#'   \item{`patientID`}{\link[base]{factor}, unique patient identifier}
#'   \item{`tissueID`}{\link[base]{factor}, TMA core identifier}
#'   \item{`recurrence`}{\link[base]{integer}, recurrence indicator, 1 = Recurred, 0 = not Recurred}
#'   \item{`recfreesurv_mon`}{\link[base]{integer}, recurrence-free survival time in months}
#'   \item{`Ki67`}{\link[base]{double}, cell signal intensity of the protein immunofloerscence signal}
#'   \item{`x`}{\link[base]{numeric}, \eqn{x}-coordinate in the cell centroid in the TMA core}
#'   \item{`y`}{\link[base]{numeric}, \eqn{y}-coordinate in the cell centroid in the TMA core}
#'   \item{`age`}{\link[base]{integer}, age at diagnosis}
#'   \item{`Tstage`}{\link[base]{integer}, tumor stage}
#'   \item{`node`}{\link[base]{factor}, node stage}
#'   \item{`HR`}{\link[base]{logical}, hormone positive status}
#'   \item{`histology`}{\link[base]{integer}, histology grade}
#'   \item{`Her2`}{\link[base]{logical}, Her2 status}
#'   \item{`race`}{\link[base]{character}, race, White, Black, Asian, Native Hawaiian or Other Pacific Islander, American Indian or Alaska Native, Unknown}
#'   \item{`adj_chemo`}{\link[base]{logical}, whether completed adjuvant chemo treatment}
#'   \item{`adj_rad`}{\link[base]{integer}, adjuvant radiation treatment, 0 = unknown,  1 = done, 2 = NOT done}
#'   \item{`horm`}{\link[base]{integer}, hormone treatment, 0 = unknown, 1 = not indicated, 2 = done, 3 = recommended, but not done}
#'   \item{`MSI`}{\link[base]{double}, mean signal intensity (mean over all cells in the TMA core)}
#' }
#' 
#' @name Ki67
'Ki67'



if (FALSE) {
  head(Ki67)
  Ki67 = Ki67 |>
    within.data.frame(expr = {  # 2025-01-17
      #Ki67 = Marker; Marker = NULL
      patientID = PATIENT_ID; PATIENT_ID = NULL
      age = AGE_AT_DX; AGE_AT_DX = NULL
      race = factor(RACE); RACE = NULL
      x = inner_x; inner_x = NULL
      y = inner_y; inner_y = NULL
      node = NodeSt; node[node == -1L] = NA_integer_; node = as.logical(node); NodeSt = NULL
      HR = HRpos; HR = as.logical(HR); HRpos = NULL
      Her2 = Her2_path_qIF; Her2 = as.logical(Her2); Her2_path_qIF = NULL
      histology = HistologicalGrade; HistologicalGrade = NULL
      adj_chemo = RadjCHEMO; adj_chemo[adj_chemo == 0] = NA_integer_; adj_chemo = (adj_chemo == 1L); RadjCHEMO = NULL
      adj_rad = RadjRAD; adj_rad[adj_rad == 0] = NA_integer_; adj_rad = (adj_rad == 1L); RadjRAD = NULL
      horm = HORM_4cat; horm[horm == 0L] = NA_integer_; horm = structure(horm, levels = c('not indicated', 'done', 'recommended, but not done'), class = 'factor'); HORM_4cat = NULL
      recurrence = RECURRENCE; RECURRENCE = NULL
      recfreesurv_mon = RECFREESURV_MO; RECFREESURV_MO = NULL
    })
  save(list = 'Ki67', file = './data/Ki67.rda', compress = 'xz')
}

