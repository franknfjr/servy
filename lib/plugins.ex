defmodule Servy.Plugins do
  @moduledoc """
  Plugins from Handler a request/response
  """
  alias Servy.Conv

  @doc """
  Logs 404 request
  """
  def track(%Conv{status: 404, path: path} = conv) do
    IO.puts("Warning: #{path} not exist!")
    conv
  end

  @doc """
  Log not 404
  """
  def track(%Conv{} = conv), do: conv

  @doc """
  Update a path
  """
  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings"}
  end

  @doc """
  Not updated
  """
  def rewrite_path(conv), do: conv

  @doc """
  Log conv
  """
  def log(conv), do: IO.inspect(conv)
end
