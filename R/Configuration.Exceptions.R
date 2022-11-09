Configuration.Exceptions <- \() {
    exception <- list()

    exception[["DSNIsNull"]] <- \(invoke) {
        if (invoke) {
            stop('Configuration has no DSN')
        }
    }
    exception[["UsernameIsNull"]] <- \(invoke) {
        if (invoke) {
            stop('Configuration has no Username')
        }
    }
    exception[["PasswordIsNull"]] <- \(invoke) {
        if (invoke) {
            stop('Configuration has no Password')
        }
    }

    return(exception)
}