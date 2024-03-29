% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dropdown_menu.R
\name{notification_item}
\alias{notification_item}
\alias{notificationItem}
\title{Create a notification item.}
\usage{
notification_item(text, icon = "warning", color = "")

notificationItem(text, icon = "warning", color = "")
}
\arguments{
\item{text}{Text of the notification.}

\item{icon}{Additional icon.}

\item{color}{Color of the notification item. One of
\code{c("", "red", "orange", "yellow", "olive", "green", "teal", "blue",
"violet", "purple", "pink", "brown", "grey", "black")}}
}
\value{
A notification item that can be passed to \code{\link[semantic.dashboard]{dropdownMenu}}
}
\description{
Create a notification item.
}
\section{Functions}{
\itemize{
\item \code{notificationItem()}: Create a notification item (alias for \code{notification_item} for
compatibility with \code{shinydashboard})

}}
\examples{
notificationItem("This is notification!", color = "red")
}
