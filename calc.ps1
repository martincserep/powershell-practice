if($args.count -eq 3) {
    if($args[0] -eq 'add'){
        printf($args[1] + '+' + $args[2] + '=' + ([int]$args[1] + [int]$args[2]))
    } elseif($args[0] -eq 'sub'){
        printf($args[1] + '-' + $args[2] + '=' + $args[1] - $args[2])
    } elseif($args[0] -eq 'mult'){
        printf($args[1] + '*' + $args[2] + '=' + $args[1] * $args[2])
    } elseif($args[0] -eq 'divide'){
        printf($args[1] + '/' + $args[2] + '=' + $args[1] / $args[2])
    } else {
        printf("wrong")
    }
} else {
    printf("Wrong arguments")
}