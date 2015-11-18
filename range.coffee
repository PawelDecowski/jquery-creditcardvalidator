class Range
    constructor: (@trie) ->
        if @trie.constructor != Trie
            throw 'Range constructor requires a Trie parameter'

    @rangeWithString: (ranges) ->
        if typeof ranges != 'string'
            throw 'rangeWithString requires a string parameter'

        ranges = ranges.replace(/ /g, '')
        ranges = ranges.split ','

        trie = new Trie

        for range in ranges
            if r = range.match /^(\d+)-(\d+)$/
                for n in [r[1]..r[2]]
                    trie.push n
            else if range.match /^\d+$/
                    trie.push range
            else
                throw "Invalid range '#{r}'"

        new Range trie

    match: (number) ->
        return @trie.find(number)