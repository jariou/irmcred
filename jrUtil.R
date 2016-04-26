DEBUG = T

function (x) 
{
  if(DEBUG)
  {
    cat("\n", as.list(match.call())$x, " -> ")
    print(x)
    cat(" ---------------------------------\n")
  }
  
}