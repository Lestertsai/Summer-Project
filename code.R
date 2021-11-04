install.packages("rpanel")
install.packages("car")
library(rpanel)
library(car)
my.fun1 <- function(panel) {
  pick=rep("a",((ncol(my.data)-1)/2))
  for (i in 1:((ncol(my.data)-1)/2)){
    pick[i]=colnames(my.data)[2*i]
    i=i+1
  }
  w=data.frame(matrix(0,ncol=3,nrow=length(pick)*nrow(my.data)))
    my.draw=function(panel){
    for (i in 1:length(pick)){
           if(panel$options[i]){
        w[(1+(i-1)*nrow(my.data)):(i*nrow(my.data)),]=cbind(
          my.data[,2*i-1],my.data[,2*i],colnames(my.data)[2*i])
        plot(my.data[,2*i-1],my.data[,2*i],xlab="Temperature"
             ,ylab="Response",main=pick[i])
                       }
      i=i+1
    }
      if(panel$options[1+length(pick)]){
        new=w[w$X3 !=0,]
        names(new)[3]="GermType"
        scatterplot(X2~X1|GermType,data=new,smooth = FALSE, 
                    grid = FALSE, frame = FALSE,regLine=FALSE,
                    xlab="Temperature",ylab="Response",
                    legend=list(title=deparse(substitute(Groups)),
                                inset=0.005,cex=0.6))
              }
    panel
  }
  my.panel=rp.control(title = "Check Buttons", mydata=my.data)
  rp.checkbox(panel = my.panel,var=options,
              action=my.draw,labels=c(pick,"Joint Plot"),
              title="Options")
  rp.button(panel = my.panel, quitbutton = TRUE, title = "Exit") 
  rp.do(my.panel,my.draw)
  panel
}
my.fun2 <- function(panel) {
  i=2
  c=rep(0,(ncol(my.data))/2-1)
  for (i in 1:((ncol(my.data))/2-1)){
    c[i]=sum(abs((my.data[,i]-my.data[,ncol(my.data)])))
    i=i+2
  }
  rp.messagebox(paste("Germ Type:"),colnames(my.data)[which.min(c)] 
                ,title = "Result")
  panel
}
my.menu <- function(panel) {
  if(panel$menu == "Open Data"){
    my.file <- file.choose()
    my.data <- read.delim(my.file,sep="\t",header=TRUE)
    fix(my.data)
  }
  if(panel$menu == "Show Data"){
    fix(my.data)
  }
     panel
}
my.panel <- rp.control(title = "Menu Demo",size = c(100, 20))
rp.menu(panel = my.panel, var = menu,
        labels = list(list("File", "Open Data", "Show Data")),
        action = my.menu)
rp.button(panel = my.panel, action = my.fun2, title = "Calculation")
rp.button(panel = my.panel, action = my.fun1, title = "Scatter Plot") 
rp.button(panel = my.panel, quitbutton = TRUE, title = "Exit") 