//
//  Generated code. Do not modify.
//  source: networking/hello_world.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'hello_world.pb.dart' as $0;

export 'hello_world.pb.dart';

@$pb.GrpcServiceName('protobuf.v1.HelloWorldService')
class HelloWorldServiceClient extends $grpc.Client {
  static final _$hello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloResponse>(
      '/protobuf.v1.HelloWorldService/Hello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));

  HelloWorldServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloResponse> hello($0.HelloRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$hello, request, options: options);
  }
}

@$pb.GrpcServiceName('protobuf.v1.HelloWorldService')
abstract class HelloWorldServiceBase extends $grpc.Service {
  $core.String get $name => 'protobuf.v1.HelloWorldService';

  HelloWorldServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloResponse>(
        'Hello',
        hello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloResponse> hello_Pre($grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return hello(call, await request);
  }

  $async.Future<$0.HelloResponse> hello($grpc.ServiceCall call, $0.HelloRequest request);
}
