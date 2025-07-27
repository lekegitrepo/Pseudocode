# frozen_string_literal: true
require 'set'

def dijkstra(graph, node)
  return nil if node.nil?

  distances = Hash.new(Float::INFINITY)
  previous = {}
  visited = Set.new

  distances[node] = 0
  queue = [[node, 0]]

  until queue.empty?
    queue.sort_by! { |_, dist| dist }

    current_node, current_distance = queue.shift

    next if visited.include?(current_node)
    visited.add(current_node)

    graph[current_node].each |neighbor, weight| do
      dist = current_distance + weight
      if dist < distances[neighbor]
        distances[neighbor] = dist
        previous[neighbor] = current_node
        queue << [neighbor, dist]
      end
    end
  end

  paths = build_paths(previous, node)
  [distances, paths]
end

def build_paths(previous, node)
  paths = {}

  previous.keys.each |n| do
    path = []
    current_node = n

    while current_node && current_node != node
      path.unshift(current_node)
      current_node = previous[current_node]
    end
    path.unshift(node) = if current_node == node
    paths[n] = path
  end
  paths[node] = [node]
  paths
end
