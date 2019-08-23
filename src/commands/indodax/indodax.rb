module Bot
    module DiscordIndodaxCommands
        module Indodax
            extend Discordrb::Commands::CommandContainer

			#indodax command
            command(:indodax, description: 'check crypto coins.', min_args: 1,
                   usage: 'indodax <query>') do |event, *query|
                indodax = query.join(' ')
                url = "https://indodax.com/api/#{indodax}_idr/ticker"
                uri = URI(url)
                response = Net::HTTP.get(uri)
                api_indodax = JSON.parse(response)
                servers = event.bot.servers
                event.channel.send_embed do |embed|
                embed.colour = 0xff8040
                embed.add_field name: "Last price #{indodax.upcase}", value: "Rp #{ title = api_indodax["ticker"]["last"] }"
                embed.add_field name: "High", value: "Rp #{ title = api_indodax["ticker"]["high"] }", inline: true
                embed.add_field name: "Low", value: "Rp #{ title = api_indodax["ticker"]["low"] }", inline: true
                embed.add_field name: "Volume #{indodax.upcase} ", value: "Rp #{ title = api_indodax["ticker"]["vol_#{indodax}"] }"
                embed.add_field name: "Volume IDR", value: "Rp #{ title = api_indodax["ticker"]["vol_idr"] }", inline: true
                embed.add_field name: "__________", value: "market: [Indodax](https://indodax.com)"
            end
            end



        end
    end
end

