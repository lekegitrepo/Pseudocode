
def add_edge(graph, node, neighbor, directed = false)
  graph = {} if graph.nil?

  if graph[node].nil?
    graph[node] = []
  end

  if graph[neighbor].nil?
    graph[neighbor] = []
  end

  graph[node] << neighbor unless graph[node].include?(neighbor)
  
  graph[node] << neighbor if !graph[node].include?(neighbor) && !directed

  graph
end
