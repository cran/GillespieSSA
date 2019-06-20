// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// simulate
List simulate(SEXP propensity_funs, const int num_functions, SEXP ssa_alg, const NumericVector& initial_state, const NumericVector& params, const IntegerMatrix& nu, const double final_time, const double census_interval, const int buffer_size, const double max_walltime, const bool stop_on_neg_state, const bool verbose, const double console_interval, const bool use_vector_optimisation);
RcppExport SEXP _fastgssa_simulate(SEXP propensity_funsSEXP, SEXP num_functionsSEXP, SEXP ssa_algSEXP, SEXP initial_stateSEXP, SEXP paramsSEXP, SEXP nuSEXP, SEXP final_timeSEXP, SEXP census_intervalSEXP, SEXP buffer_sizeSEXP, SEXP max_walltimeSEXP, SEXP stop_on_neg_stateSEXP, SEXP verboseSEXP, SEXP console_intervalSEXP, SEXP use_vector_optimisationSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< SEXP >::type propensity_funs(propensity_funsSEXP);
    Rcpp::traits::input_parameter< const int >::type num_functions(num_functionsSEXP);
    Rcpp::traits::input_parameter< SEXP >::type ssa_alg(ssa_algSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type initial_state(initial_stateSEXP);
    Rcpp::traits::input_parameter< const NumericVector& >::type params(paramsSEXP);
    Rcpp::traits::input_parameter< const IntegerMatrix& >::type nu(nuSEXP);
    Rcpp::traits::input_parameter< const double >::type final_time(final_timeSEXP);
    Rcpp::traits::input_parameter< const double >::type census_interval(census_intervalSEXP);
    Rcpp::traits::input_parameter< const int >::type buffer_size(buffer_sizeSEXP);
    Rcpp::traits::input_parameter< const double >::type max_walltime(max_walltimeSEXP);
    Rcpp::traits::input_parameter< const bool >::type stop_on_neg_state(stop_on_neg_stateSEXP);
    Rcpp::traits::input_parameter< const bool >::type verbose(verboseSEXP);
    Rcpp::traits::input_parameter< const double >::type console_interval(console_intervalSEXP);
    Rcpp::traits::input_parameter< const bool >::type use_vector_optimisation(use_vector_optimisationSEXP);
    rcpp_result_gen = Rcpp::wrap(simulate(propensity_funs, num_functions, ssa_alg, initial_state, params, nu, final_time, census_interval, buffer_size, max_walltime, stop_on_neg_state, verbose, console_interval, use_vector_optimisation));
    return rcpp_result_gen;
END_RCPP
}
// make_ssa_btl
SEXP make_ssa_btl(double f);
RcppExport SEXP _fastgssa_make_ssa_btl(SEXP fSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type f(fSEXP);
    rcpp_result_gen = Rcpp::wrap(make_ssa_btl(f));
    return rcpp_result_gen;
END_RCPP
}
// make_ssa_direct
SEXP make_ssa_direct();
RcppExport SEXP _fastgssa_make_ssa_direct() {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    rcpp_result_gen = Rcpp::wrap(make_ssa_direct());
    return rcpp_result_gen;
END_RCPP
}
// make_ssa_em
SEXP make_ssa_em(double tau, double noise_strength);
RcppExport SEXP _fastgssa_make_ssa_em(SEXP tauSEXP, SEXP noise_strengthSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type tau(tauSEXP);
    Rcpp::traits::input_parameter< double >::type noise_strength(noise_strengthSEXP);
    rcpp_result_gen = Rcpp::wrap(make_ssa_em(tau, noise_strength));
    return rcpp_result_gen;
END_RCPP
}
// make_ssa_etl
SEXP make_ssa_etl(double tau);
RcppExport SEXP _fastgssa_make_ssa_etl(SEXP tauSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< double >::type tau(tauSEXP);
    rcpp_result_gen = Rcpp::wrap(make_ssa_etl(tau));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_fastgssa_simulate", (DL_FUNC) &_fastgssa_simulate, 14},
    {"_fastgssa_make_ssa_btl", (DL_FUNC) &_fastgssa_make_ssa_btl, 1},
    {"_fastgssa_make_ssa_direct", (DL_FUNC) &_fastgssa_make_ssa_direct, 0},
    {"_fastgssa_make_ssa_em", (DL_FUNC) &_fastgssa_make_ssa_em, 2},
    {"_fastgssa_make_ssa_etl", (DL_FUNC) &_fastgssa_make_ssa_etl, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_fastgssa(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
