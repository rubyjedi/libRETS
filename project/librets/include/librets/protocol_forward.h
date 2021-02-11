/*
 * Copyright (C) 2005 National Association of REALTORS(R)
 *
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished
 * to do so, provided that the above copyright notice(s) and this
 * permission notice appear in all copies of the Software and that
 * both the above copyright notice(s) and this permission notice
 * appear in supporting documentation.
 */
#ifndef LIBRETS_PROTOCOL_FORWARD_H
#define LIBRETS_PROTOCOL_FORWARD_H

/** 
 * @file protocol_forward.h
 * (Internal) Contains the RETS protocolclasses forward declarations.
 */
/// @cond MAINTAINER

#include <boost/shared_ptr.hpp>

namespace librets {

class RetsSession;
/** Smart pointer to RetsSession. */
typedef boost::shared_ptr<RetsSession> RetsSessionPtr;

class LoginResponse;
/** Smart pointer to LoginResponse. */
typedef boost::shared_ptr<LoginResponse> LoginResponsePtr;
typedef std::unique_ptr<LoginResponse> LoginResponseAPtr;

class CapabilityUrls;
/** Smart pointer to CapabilityUrls. */
typedef boost::shared_ptr<CapabilityUrls> CapabilityUrlsPtr;
typedef std::unique_ptr<CapabilityUrls> CapabilityUrlsAPtr;

class SearchRequest;
/** Smart pointer to SearchRequest. */
typedef boost::shared_ptr<SearchRequest> SearchRequestPtr;
typedef std::unique_ptr<SearchRequest> SearchRequestAPtr;

class SearchResultSet;
/** Smart pointer to SearchResultSet. */
typedef boost::shared_ptr<SearchResultSet> SearchResultSetPtr;
typedef std::unique_ptr<SearchResultSet> SearchResultSetAPtr;

class GetObjectRequest;
/** Smart pointer to GetObjectRequest. */
typedef boost::shared_ptr<GetObjectRequest> GetObjectRequestPtr;
typedef std::unique_ptr<GetObjectRequest> GetObjectRequestAPtr;

class ObjectDescriptor;
/** Smart pointer to ObjectDescriptor. */
typedef boost::shared_ptr<ObjectDescriptor> ObjectDescriptorPtr;
typedef std::unique_ptr<ObjectDescriptor> ObjectDescriptorAPtr;

class GetObjectResponse;
/** Smart pointer to GetObjectResponse. */
typedef boost::shared_ptr<GetObjectResponse> GetObjectResponsePtr;
typedef std::unique_ptr<GetObjectResponse> GetObjectResponseAPtr;

class LogoutResponse;
/** Smart pointer to LogoutResponse. */
typedef boost::shared_ptr<LogoutResponse> LogoutResponsePtr;
typedef std::unique_ptr<LogoutResponse> LogoutResponseAPtr;

class ServerInformationRequest;
/** Smart pointer to ServerInformationRequest. */
typedef boost::shared_ptr<ServerInformationRequest> ServerInformationRequestPtr;
typedef std::unique_ptr<ServerInformationRequest> ServerInformationRequestAPtr;

class ServerInformationResponse;
/** Smart pointer to ServerInformationResponse. */
typedef boost::shared_ptr<ServerInformationResponse> ServerInformationResponsePtr;
typedef std::unique_ptr<ServerInformationResponse> ServerInformationResponseAPtr;

class UpdateRequest;
/** Smart pointer to UpdateRequest. */
typedef boost::shared_ptr<UpdateRequest> UpdateRequestPtr;
typedef std::unique_ptr<UpdateRequest> UpdateRequestAPtr;

class UpdateResponse;
/** Smart pointer to UpdateResponse. */
typedef boost::shared_ptr<UpdateResponse> UpdateResponsePtr;
typedef std::unique_ptr<UpdateResponse> UpdateResponseAPtr;

class PayloadListResultSet;
/** Smart pointer to PayloadListResultSet */
typedef boost::shared_ptr<PayloadListResultSet> PayloadListResultSetPtr;
typedef std::unique_ptr<PayloadListResultSet> PayloadListResultSetAPtr;
};
/// @endcond
#endif

/* Local Variables: */
/* mode: c++ */
/* End: */
