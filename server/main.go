package main

func main() {

	// inicia todas as dependencias
	// app := fx.New(
	// 	fx.Provide(

	// 		// log
	// 		logger.Init,

	// 		// Rest
	// 		config.GetParamsDb,
	// 		db.NewRepository,
	// 		rest_server.NewChi,

	// 		// grpc
	// 		grpc_server.InitGRPCserver,
	// 	),

	// 	fx.Invoke(
	// 		rest_server.RegisterRoutes,
	// 		grpc_server.RunGRPCServer,
	// 		grpc_server.RegisterGrpcModules,
	// 	),
	// )

	// // inicia aplicação
	// app.Run()

}
