defmodule Disqualified do
  use Application

  def start(_type, _args) do
    Disqualified.GameController.start_link()
  end
end
