const historyEl = document.querySelector('#chat-history');
const messageTextEl = document.querySelector('#chat-message-text');
const messageHistoryEl = document.querySelector('#chat-history');

function addMessage(message) {
  let newMessageEl = document.createElement("div");
  newMessageEl.innerText = `[${message.time}] ${message.text}`;
  messageHistoryEl.appendChild(newMessageEl);
}

exports.connect = (socket) => {
  const channel = socket.channel("room:general", {});

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) });
  
  messageTextEl.addEventListener("keypress", event => {
    if (event.keyCode !== 13) return;

    channel.push("message", {text: messageTextEl.value});
    messageTextEl.value = "";
  });

  channel.on("message", payload => {
    console.log('> message', payload);

    addMessage(payload);
  });
}
