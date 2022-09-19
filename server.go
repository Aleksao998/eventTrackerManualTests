// ADD event signature
const (
	EventABI = `event ValidatorSetChange(uint256 indexed index,tuple(address ecdsaAddress, bytes blsPublicKey)[] Validator,int8 indexed changeType)`
)

// Add tracker init in the server.go -> NewServer (line 203 after we initialize blockchain) 


// Tracer
trackerConfig := rootchain.ConfigEvent{
	EventABI:           EventABI,
	MethodABI:          "",
	LocalAddress:       "0x56B572e4eD62e421bA66EB14cB21e9BE04821D77",
	PayloadType:        0,
	BlockConfirmations: 6,
}
tracker, err := tracker.NewEventTracker(logger, &trackerConfig, "ws://localhost:10002/ws")
if err != nil {
	return nil, err
}

eventChan := tracker.GetEventChannel()

tracker.Start(1)

go func() {
	for {
		select {
		case msg := <-eventChan:
			fmt.Println("New event", msg)
		}
	}
}()


