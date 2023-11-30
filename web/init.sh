#!/bin/bash

[ -d "prisma/migrations" ] && npm run start || npm run start:seed