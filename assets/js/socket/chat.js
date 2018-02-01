const historyEl = document.querySelector('#chat-history');
const messageTextEl = document.querySelector('#chat-message-text');
const messageHistoryEl = document.querySelector('#chat-history');
const usernameEl = document.querySelector('#chat-username');

function addMessage(message) {
  let newMessageEl = document.createElement("div");
  newMessageEl.innerText = `[${message.time}] - ${message.author || '<unknown>'}: ${message.text}`;
  messageHistoryEl.appendChild(newMessageEl);
}

exports.connect = (socket) => {
  const channel = socket.channel("room:general", {});

  channel.join()
    .receive("ok", resp => {
      console.log("> join: success", resp)
      
      channel.push("history", {});
    })
    .receive("error", resp => console.log("> join: error", resp));
  
  messageTextEl.addEventListener("keypress", event => {
    if (event.keyCode !== 13) return;

    channel.push("message", {author: usernameEl.value, text: messageTextEl.value});
    messageTextEl.value = "";
  });

  channel.on("message", payload => {
    console.log('> message', payload);

    addMessage(payload);
  });

  channel.on("history", payload => {
    console.log('> history', payload);

    payload.messages.forEach(addMessage);
  });
}
