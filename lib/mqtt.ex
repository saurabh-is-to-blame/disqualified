defmodule Mqtt do

  @mqtt_host "127.0.0.1"

  def connect do
    IO.puts @mqtt_host
    :emqttc.start_link([
      {:host,to_char_list @mqtt_host},
      {:client_id,"disq_0"},
      {:keepalive,0},
      {:port,1883},
      {:reconnect,{2,5,0}}
    ])
  end

  def subscribe(client,topic,qos) do
    :emqttc.subscribe(client, topic,qos)
  end

  def publish(client,topic,message) do
    :emqttc.publish(client, topic, message)
  end

  def publish(client,topic,message,qos) do
    :emqttc.publish(client, topic, message,[{:qos,qos}])
  end

  def disconnect(client) do
    :emqttc.disconnect(client)
  end

end
