module SStream

### Class
#-- Name: T
#-- Parameters: content: str
#-- Description:
#--   A class that takes a string `content` and will
#--   give back tokens that are split by ' ', '\t', '\n', and '\r'.
@pub class T [content: str] {
    @pub @const let content = content;
    @pub @const let EOF = "EOF";

    fn ignorable(c) {
        content[0] == ' '
        || content[0] == '\t'
        || content[0] == '\n'
        || content[0] == '\r';
    }

    ### Method
    #-- Name: adv
    #-- Returns: str
    #-- Description:
    #--   Returns the next token in the string
    #--   after splitting on the delimiters.
    @pub fn adv(): str {
        while this.content != "" && this.ignorable(this.content[0]) {
            this.content.pop(0);
        }

        if this.content == "" {
            this.EOF;
        }

        let buf = "";

        while this.content != "" && !this.ignorable(this.content[0]) {
            buf += this.content[0];
            this.content.pop(0);
        }

        buf;
    }
    ### End
}
### End
