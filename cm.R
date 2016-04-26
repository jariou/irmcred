function (
          formula, 
          data, 
          ratios, 
          weights, 
          subset, 
          regformula = NULL,            
          regdata, 
          adj.intercept = FALSE, 
          method = c("Buhlmann-Gisler", "Ohlsson", "iterative"), 
          tol = sqrt(.Machine$double.eps), 
          maxit = 100, 
          echo = FALSE
          ) 
{
    Call <- match.call()
    tf <- terms(formula)
    level.numbers <- attr(tf, "order")
    level.names <- rownames(attr(tf, "factors"))
    nlevels <- length(level.names)
    
    if (any(duplicated(level.numbers))) 
        stop("unsupported interactions in 'formula'")
        
    if (nlevels > 1 && !is.null(regformula)) 
        stop("hierarchical regression models not supported")
        
    if (missing(ratios) & !missing(weights)) 
        stop("ratios have to be supplied if weights are")
        
    m <- match(
                c("data", "ratios", "weights", "subset"), 
                names(Call), 
                0
                )
                
    cl <- Call[c(1, m[c(1, 4)])]
    cl[[1]] <- as.name("subset")
    names(cl)[2] <- "x"
    cl$select <- level.names
    levs <- eval(cl, parent.frame())
    
    ilevs <- apply(
                   levs, 
                   2, 
                   function(x) as.integer(factor(x))
                   )
    
    cl$select <- if (missing(ratios)) 
        setdiff(colnames(data), level.names)
    else Call[[m[2]]]
    
    ratios <- as.matrix(eval(cl, parent.frame()))
    
    weights <- if (missing(weights)) {
        if (any(is.na(ratios))) 
            stop("missing ratios not allowed when weights are not supplied")
        array(1, dim(ratios))
    }
    else {
        cl$select <- Call[[m[3]]]
        as.matrix(eval(cl, parent.frame()))
    }
    
    if (nlevels < 2) {
        method <- match.arg(method)
        
        if (method == "Buhlmann-Gisler" || method == "Ohlsson") 
            method <- "unbiased"
            
        if (is.null(regformula)) {
            res <- bstraub(
                           ratios, 
                           weights, 
                           method = method, 
                           tol = tol, 
                           maxit = maxit, 
                           echo = echo
                           )
        }
        else {
            trf <- terms(regformula)
            
            res <- if (length(attr(trf, "factors")) == 0) {
                warning("empty regression model; fitting with Buhlmann-Straub's model")
                bstraub(ratios, weights, method = method, tol = tol, 
                  maxit = maxit, echo = echo)
            }
            else hache(ratios, weights, regformula, regdata, 
                adj.intercept = adj.intercept, method = method, 
                tol = tol, maxit = maxit, echo = echo)
        }
        res$classification <- levs
        res$ordering <- list(seq_along(levs))
    }
    else {
        res <- hierarc(ratios, weights, classification = ilevs, 
            method = method, tol = tol, maxit = maxit, echo = echo)
        res$classification <- levs
    }
    
    names(res$means) <- names(res$weights) <- c("portfolio", level.names)
    
    names(res$unbiased) <- if (!is.null(res$unbiased)) 
        names(res$means)
        
    names(res$iterative) <- if (!is.null(res$iterative)) 
        names(res$means)
        
    names(res$nodes) <- names(res$ordering) <- level.names
    
    if (is.list(res$cred)) 
        names(res$cred) <- level.names
        
    class(res) <- c("cm", class(res))
    
    attr(res, "call") <- Call
    
    res
}
<environment: namespace:actuar>
> 