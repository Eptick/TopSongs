export default function(isLoading = true, isFinished = false, isError = false) {
    return {
        isLoading,
        isFinished,
        isError,
    }
}