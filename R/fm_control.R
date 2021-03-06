##' @title Auxiliary for Controlling FM Fitting
##'
##' @description
##' Auxiliary function for \code{\link{fm.train}} fitting.
##'
##' @usage
##' model.control(task = "CLASSIFICATION", solver = "TDAP")
##'
##' @param task A character string naming the task for FM model, such as
##' "CLASSIFICATION", "REGRESSION"
##' @param solver A character string naming an optimization routine of FM model, the default
##' solver is "TDAP"
##' @param ... a list of parameters for controlling the fitting process
##'
##' @details
##' FMwR provide many optimization routines including:
##' \itemize{
##' \item "SGD": stochastic gradient descent, supporting ℓ1 or ℓ2  \code{\link{SGD.solver}}
##' \item "FTRL": FTRL-Proximal  \code{\link{FTRL.solver}}
##' \item "TDAP":  \code{\link{TDAP.solver}}
##' \item "MCMC":  \code{\link{MCMC.solver}}
##' \item "ALS":  \code{\link{ALS.solver}}
##' }
##'
##' The other parameters including:
##' \describe{
##' \item{\code{keep.w0}}{whether to keep intercept, default TRUE}
##' \item{\code{L2.w0}}{regularization of intercept, default 0.0}
##' \item{\code{keep.w1}}{whether to keep 1-way interaction, default TRUE}
##' \item{\code{L1.w1}}{ℓ1 regularization of 1-way interaction, default 0.0}
##' \item{\code{L2.w1}}{ℓ2 regularization of 1-way interaction, default 0.0}
##' \item{\code{factor.number}}{number of 2-way latent factors, default 2L}
##' \item{\code{v.init_mean}}{mean for initialization of 2-ways latent factors, default 0.0}
##' \item{\code{v.init_stdev}}{stdev for initialization of 2-ways latent factors, default 0.01}
##' \item{\code{L1.v}}{ℓ1 regularization of 2-way interaction, default 0.0}
##' \item{\code{L2.v}}{ℓ2 regularization of 2-way interaction, default 0.0}
##' }
##'
##' @examples
##' model.control() # the default settings
##'
##'
model.control <- function(task = c("CLASSIFICATION", "REGRESSION", "RANK"), ...) #TODO:RANK
{
  task <- match.arg(task)
  controls <- control_assign(model.control.default, list(...))
  res <- list(task = task, hyper.params = controls$contr)
  class(res) <- "model.control"
  res
}

model.control.default <- list(
  # w0
  keep.w0       = TRUE,
  L2.w0         = 0.0,
  # w1
  keep.w1       = TRUE,
  L1.w1         = 0.0,
  L2.w1         = 0.0,
  # v
  factor.number = 2L,
  v.init_mean   = 0.0,
  v.init_stdev  = 0.01,
  L1.v          = 0.0,
  L2.v          = 0.0
)
