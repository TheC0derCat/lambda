// Function to sanitize input
void sanitize_input(char *input) {
    for (int i = 0; input[i]; i++) {
        // Remove non-printable characters
        if (!isprint(input[i])) {
            input[i] = '\0';
            break;
        }
    }
}
char *getinput() {
    char *buffer = malloc(100 * sizeof(char));
    if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        // Remove newline
        buffer[strcspn(buffer, "\n")] = 0;
        // Sanitize input
        sanitize_input(buffer);
        // printf("Sanitized input: %s\n", buffer);
        return buffer;
    }
    return NULL;
}
