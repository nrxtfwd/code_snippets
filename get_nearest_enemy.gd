func get_nearest_enemy():
    var enemy 
    var nearest_dist = INF
    for this in get_tree().get_nodes_in_group('enemy'):
        var dist = this.global_position.distance_to(base_self.global_position)
        if dist < nearest_dist:
            enemy = this
            nearest_dist = dist
    return enemy
