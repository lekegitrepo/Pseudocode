require 'set'

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

def bfs_traversal(graph, node)
  queue = []
  visited = Set.new
  queue << node
  visited << node

  while !queue.empty?
    current_node = queue.shift

    # process current_node here

    graph[current_node].each do |neighbor|
      unless visited.include?(neighbor)
        queue << neighbor
        visited << neighbor
      end
    end
  end

  visited
end
